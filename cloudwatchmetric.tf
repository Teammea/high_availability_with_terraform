# Cloudwatch metric for scaling
resource "aws_cloudwatch_metric_alarm" "scale_up" {
  alarm_name          = "scale_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This metric triggers an alarm when the average CPU usage exceeds 70% for 2 consecutive periods of 120 seconds."
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]
}