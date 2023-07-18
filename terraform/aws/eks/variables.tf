# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "default"
}
