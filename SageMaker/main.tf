resource "aws_cloudwatch_metric_alarm" "model_latency" {
  for_each            = toset(var.endpoint_name)
  alarm_name          = "${var.project}-${var.name_service}-model_latency${each.key}-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.model_latency_evaluation_periods
  metric_name         = "ModelLatency"
  namespace           = "AWS/SageMaker"
  period              = var.model_latency_period
  statistic           = "Average"
  threshold           = var.model_latency_threshold
  alarm_description   = "This metric monitors model latency"

  tags = merge({
    Name = "${var.project}-${var.name_service}-model_latency${each.key}-${var.environment}"
    }
  )
  dimensions = merge(local.common_dimensions, { EndpointName = each.key })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  for_each            = toset(var.endpoint_name)
  alarm_name          = "${var.project}-${var.name_service}-cpu_utilization${each.key}-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.cpu_utilization_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/SageMaker"
  period              = var.cpu_utilization_period
  statistic           = "Average"
  threshold           = var.cpu_utilization_threshold
  alarm_description   = "This metric monitors sagemaker endpoint cpu utilization"

  tags = merge({
    Name = "${var.project}-${var.name_service}-cpu_utilization${each.key}-${var.environment}"
    }
  )
  dimensions = merge(local.common_dimensions, { EndpointName = each.key })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions
}

resource "aws_cloudwatch_metric_alarm" "invocation_5xx_errors" {
  for_each            = toset(var.endpoint_name)
  alarm_name          = "${var.project}-${var.name_service}-invocation_5xx_errors${each.key}-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.invocation_5xx_errors_evaluation_periods
  metric_name         = "Invocation5XXErrors"
  namespace           = "AWS/SageMaker"
  period              = var.invocation_5xx_errors_period
  statistic           = "Sum"
  threshold           = var.invocation_5xx_errors_threshold
  alarm_description   = "This metric monitors sagemaker endpoint invocation 5xx errors"

  tags = merge({
    Name = "${var.project}-${var.name_service}-invocation_5xx_errors${each.key}-${var.environment}"
    }
  )
  dimensions = merge(local.common_dimensions, { EndpointName = each.key })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions
}
