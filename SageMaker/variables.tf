############
#Variables
############
variable "endpoint_name" {
  description = "Nombre del endpoint del modelo SageMaker a monitorear"
  type        = list(string)
}

variable "sns_topic_arn" {
  description = "Topic ARN para notificaciones"
  type        = string
}

#######################################
#Propiedades default ModelLatency
#######################################
variable "model_latency_evaluation_periods" {
  type    = number
  default = 1000 # 3 # de periodo  /  1  * 60 segundos  =  180 segundos  =  3 minutos
}

variable "model_latency_period" {
  type    = number
  default = 60 #valor en segundos
}

variable "model_latency_threshold" {
  type    = number
  default = 1000 # 1000 ms (ajústable segun el proyecto)
}

#######################################
#Propiedades default CPUUtilization
#######################################
variable "cpu_utilization_evaluation_periods" {
  type    = number
  default = 5 # de periodo  /  1  * 60 segundos  =  300 segundos  =  5 minutos  
}

variable "cpu_utilization_period" {
  type    = number
  default = 60 #valor en segundos  
}

variable "cpu_utilization_threshold" {
  type    = number
  default = 80 #80% (ajustable segun el proyecto)  
}

#######################################
#Propiedades default Invocation5XXErrors
#######################################
variable "invocation_5xx_errors_evaluation_periods" {
  type    = number
  default = 1 # de periodo  /  1  * 60 segundos  =  60 segundos  =  1 minuto  
}

variable "invocation_5xx_errors_period" {
  type    = number
  default = 60 #valor en segundos
}

variable "invocation_5xx_errors_threshold" {
  type    = number
  default = 1 #(cualquier error 5XX debe alertar - Modificable segun la necesidad)
}


###############################
# Variables generales
###############################
variable "project" {
  type = string
}


variable "name_service" {
  type    = string
  default = "SageMaker"
}

variable "purpose" {
  type    = string
  default = "monitoring"
}

variable "environment" {
  type = string
}

