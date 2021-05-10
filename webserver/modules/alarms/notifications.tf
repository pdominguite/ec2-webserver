resource "aws_sns_topic" "alarm_topic" {
  name = "email-notification-for-alarm"
}

resource "aws_sns_topic_subscription" "email_notification" {
  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol  = "email"
  endpoint  = var.email_to_notify
}
