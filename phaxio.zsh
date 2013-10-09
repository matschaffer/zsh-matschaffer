fax() {
  FILE=$1
  NUMBER=$2
  [[ -z $FILE ]] || [[ -z "$NUMBER" ]] && echo "Usage: fax FILE NUMBER" && return 1

  curl https://api.phaxio.com/v1/send \
       -F "to=$NUMBER" \
       -F "filename=@$FILE" \
       -F "api_key=$PHAXIO_KEY" \
       -F "api_secret=$PHAXIO_SECRET"
}
