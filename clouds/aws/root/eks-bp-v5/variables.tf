variable "preffix" {
  description = "Preffix of the demo"
  type        = string
}

#https://docs.cloudbees.com/docs/cloudbees-common/latest/supported-platforms/cloudbees-ci-cloud
variable "kubernetes_version" {
  description = "Kubernetes version to use for the EKS cluster. Supported versions are 1.23 and 1.24."
  default     = "1.24"
  type        = string

  validation {
    condition     = contains(["1.23", "1.24"], var.kubernetes_version)
    error_message = "Provided Kubernetes version is not supported by EKS and/or CloudBees."
  }
}

variable "domain_name" {
  description = "An existing domain name maped to a Route 53 Hosted Zone"
  type        = string
}

variable "aws_profile" {
  description = "A configured aws profile name"
  default     = "default"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  default     = {}
  type        = map(string)
}

variable "lb_type" {
  description = "Type of load balancer to use."
  default     = "alb"
  type        = string

  validation {
    condition     = contains(["alb", "nlb"], var.lb_type)
    error_message = "Load balancer type must be either 'alb' or 'nlb'."
  }
}

variable "windows_nodes" {
  description = "Enable Windows nodes for Agents Node Pool."
  default     = false
  type        = bool
}

variable "enable_addon_global" {
  description = "Enable Kubernetes addons for EKS Blueprints. Helm provider."
  default     = true
  type        = bool
}

variable "enable_velero_backup" {
  description = "Enable Velero for Backups."
  default     = true
  type        = bool
}

variable "enable_addon_cluster_autoscaler" {
  description = "Enable cluster-autoscaler. Enabling autoscaling is a good practice. Disable this add-ons is useful to demostrate its consequences."
  default     = true
  type        = bool
}

variable "enable_addon_kube_prometheus_stack" {
  description = "Enable kube-prometheus-stack."
  default     = true
  type        = bool
}

variable "grafana_admin_password" {
  description = "Grafana admin password."
  type        = string
}

variable "enable_node_problem_detector" {
  description = "Enable enable_node_problem_detector."
  default     = true
  type        = bool
}
