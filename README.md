
# CI/CD Practice

![image](images/cicd.png "CI/CD")

## Project

In this project we are implementing CI/CD using cloud services.

## Requirements

- They want a storage unit that will be called acme-storage, it will be an AWS S3 bucket

- They want the deployment flow to be "Continuous Delivery" in the main branch, that is, an administrator will validate the command to put the infrastructure into production

- However, in branches other than main, the deployment will be "Continuous Deployment" and there will be no manual approval, it will be fully automatic

- ACME developers must also be able to deploy from their machines

- They want the credentials to deploy to never be saved in the code

- In addition, ACME also wants to check every 10 minutes that the content in the storage unit does not exceed 20MiB. If this happens, it will be emptied automatically

- ACME has been using Jenkins for a long time but is currently opening up to try new technologies with lower management costs such as Github Actions. 

- This is why a Github actions pipeline is also required for the storage unit deployment, so that ACME can compare both technologies.

## Local

- Developer can use Makefile to push changes to AWS S3 Bucket

How to

    cd local-deployment
    make help
    make push
    make clean

## Jenkings 

- We are using jenkings for CI/CD, using existing plugings for commom taks

## Terraform

- We are using Terraform for Infrastructure as code tool


## Github Actions

- The ACME company wants to try another alternatives, for that we use Github Actions. We created a custom actions that allow to connect with AWS S3 Bucket

## Final Thoughts

- After evaluated two alternatives Jenkins and Github Actions I recommend to continue with Github actions because:

- Ease of Setup compare to Jenkins
- Github Actions has more integration with Github
- In Github Actions you only pay the time you run the pipeline vs maintain a server running, so is cheap compare to Jenkins