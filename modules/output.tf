output "alb" {
  value = {
    dns_name         = "${aws_alb.alb.dns_name}"
    arn              = "${aws_alb.alb.arn}"
    target_group_arn = "${aws_alb_target_group.alb.arn}"
    cluster_name     = "${aws_ecs_cluster.ecs_cluster.name}"
  }
}
