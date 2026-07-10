## This is my test lambda function. It will be deployed to AWS Lambda and invoked from a GitHub Actions workflow.
import json
import urllib.request

def lambda_handler(event, context):
    api_url = "http://172.31.8.166/hi"

    try:
        with urllib.request.urlopen(api_url, timeout=5) as response:
            body = response.read().decode("utf-8")
            status_code = response.status
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": f"Called {api_url}",
            "response_status": status_code,
            "response_body": body
        })
    }