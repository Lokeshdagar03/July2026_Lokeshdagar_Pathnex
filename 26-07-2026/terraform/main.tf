resource "aws_cloudwatch_log_group" "pathnex_flow_logs_group" {
  name = "pathnex-flow-logs"
}

resource "aws_vpc_flow_log" "pathnex_flow_log" {
  log_group_name      = aws_cloudwatch_log_group.pathnex_flow_logs_group.name
  traffic_type        = "ALL"
  log_destination_type = "cloud-watch-logs"

  # Replace with your VPC ID when using AWS
  vpc_id = "vpc-xxxxxxxx"
}