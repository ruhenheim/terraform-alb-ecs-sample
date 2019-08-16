resource "aws_alb" "alb" {
  name                       = "${var.name}-${terraform.workspace}"
  security_groups            = ["${var.security_group}"]
  subnets = [
    "subnet-xxxxxxxx",
    "subnet-xxxxxxxx",
  ]
  internal                   = false
  enable_deletion_protection = false

  access_logs {
    bucket = "${var.bucket}"
  }
}

resource "aws_alb_target_group" "alb" {
  name     = "${var.name}-${terraform.workspace}-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
  target_type = "ip"

  health_check {
    interval            = 30
    path                = "/ping"
    // NOTE: defaultはtraffic-port
    //port                = 3000
    protocol            = "HTTP"
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 5
    matcher             = 200
  }
}

resource "aws_alb_listener" "alb_443" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2015-05"
  certificate_arn   = "${var.alb_certificate_arn}"

  default_action {
    target_group_arn = "${aws_alb_target_group.alb.arn}"
    type             = "forward"
  }
}
