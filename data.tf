data "ibm_security_group" "allow_bastion_ssh" {
  name = "allow_ssh_from_bastion"
}

data "ibm_security_group" "allow_outbound" {
  name = "allow_outbound"
}
