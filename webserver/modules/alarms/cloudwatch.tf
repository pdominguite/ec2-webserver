data "aws_instance" "webserver" {
  filter {
    name   = "tag:service"
    values = ["${var.service_name}"]
  }

  filter {
    name   = "tag:environment"
    values = ["${var.service_environment}"]
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  alarm_name                = "cpu-utilization-alarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "5"
  datapoints_to_alarm       = "3"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors EC2 CPU utilization"

  dimensions = {
    InstanceId = data.aws_instance.webserver.id
  }

  alarm_actions = [
    aws_sns_topic.alarm_topic.arn
  ]

  ok_actions = [
    aws_sns_topic.alarm_topic.arn
  ]
}
