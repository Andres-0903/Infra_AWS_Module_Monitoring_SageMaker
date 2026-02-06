##########
# Locals
##########
locals {
  # Si lo vas a usar en dimensions de métricas, déjalo;
  # si no, puedes eliminarlo.
  common_dimensions = {
    # Ejemplo futuro:
    # Environment = var.environment
    # Project     = var.project
  }

  # Asegura que pasas una lista de ARNs válida a las alarmas.
  # Si no hay ARN (null o cadena vacía), deja lista vacía.
  alarm_actions = (
    var.sns_topic_arn != null && trim(var.sns_topic_arn) != ""
  ) ? [var.sns_topic_arn] : []

  ok_actions = local.alarm_actions
}
