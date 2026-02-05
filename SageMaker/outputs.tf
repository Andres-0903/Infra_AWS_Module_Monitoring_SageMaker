

output "model_latency" {
  description = "Latency for model"
  value       = aws_cloudwatch_metric_alarm.model_latency

}

output "cpu_utilization" {
  description = "cpu utilization for model"
  value       = aws_cloudwatch_metric_alarm.cpu_utilization
}

output "invocation_5xx_errors" {
  description = "Total errors 5xx"
  value       = aws_cloudwatch_metric_alarm.invocation_5xx_errors

}
