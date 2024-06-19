### Global config
vpc_id    = "vpc-00609fbfe87cab659"
subnet_id = "subnet-0dfb54838e1d03509"
zone_name = "anna-takacs.com"

### ECR config

repository_name                   = "linux-tweet-app"
repository_read_write_access_arns = ["arn:aws:iam::471112859559:role/linux-twiiter-ec2-role"]
repository_read_access_arns       = ["arn:aws:iam::471112859559:role/terraform-role"]

### Route53 config

route_name = "demo1.anna-takacs.com"
route_type = "A"
route_ttl  = 300

### SG config

sg_name        = "linux-tweet-app-sg"
sg_description = "Security group for linux tweet app EC2 instance"

### EC2 config

instance_name = "linux-tweet-app"
instance_type = "t3.micro"

### S3 bucket config

bucket_name = "letsencrypt-cert-bucket"

### ACME config

email_address             = "annaa.takacs@gmail.com"
subject_alternative_names = ["demo1.anna-takacs.com"]
