##########
#Locals
##########
locals {

  common_dimensions = {
  }

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]
}
