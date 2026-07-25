resource "aws_sns_topic" "pathnex_alerts" {
  name = "pathnex-alerts"
}

resource "aws_cloudwatch_metric_alarm" "pathnex_cpu_alarm" {
  alarm_name          = "pathnex-cpu-utilization-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 80

  alarm_actions = [
    aws_sns_topic.pathnex_alerts.arn
  ]
}