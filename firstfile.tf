# provider "aws" {
#     region = "us-east-2"
#     access_key = "fsdgfs"
#     secret_key = "dfgasgsg"
# }

provider "aws" {
    region = "us-east-2"
    profile = "cos-profile-terraform-course"
}


//String Example
variable firststring {
  type        = string
  default     = "this is my first string"
  description = "a first string"
}

variable multilinestring {
  type        = string
  default     = <<EOH
this is a
multiline string
                EOH
}

output myfirstoutput {
  value       = "${var.firststring}"
  description = "consume first string var"
}

output multilineoutput {
    value = "${var.multilinestring}"
    description = "output of a multiline string"
}

//This is my maps Example
variable mapexample {
    type = map
    default = {
        "useast" = "ami1"
        "euwest" = "ami2"
    }
}

output mapoutput {
    value = "${var.mapexample["useast"]}"
}

//This is array/list

variable mysecuritygropulist {
    type = list
    default = ["sg1", "sg2", "sg3"]
}

output sgoutput {
    value = "${var.mysecuritygropulist[0]}"
}

output sgoutputs {
    value = "${var.mysecuritygropulist}"
}


//This is a boolean
variable testbool {
    default = true
}

output booloutput {
    value = "${var.testbool}"
}


// My input variable example
variable myinput {
    type = string
}

output myinputoutput {
    sensitive = true
    value = "${var.myinput}"
}


