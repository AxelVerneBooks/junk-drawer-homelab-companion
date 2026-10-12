export RESTIC_REPOSITORY='s3:https://s3.us-west-002.backblazeb2.com/my-lab-backup'
export RESTIC_PASSWORD='your-restic-password'
export AWS_ACCESS_KEY_ID='your-b2-app-key'
export AWS_SECRET_ACCESS_KEY='your-b2-app-secret'

restic init
