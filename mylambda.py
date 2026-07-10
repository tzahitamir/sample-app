import json

def lambda_handler(event, context):
    # Placeholder - will call API Gateway URL once it exists 
    api_url = "http://172.31.8.166/hi"
    
    return {
        "statusCode": 200,
        "body": json.dumps({"message": f"Would call: {api_url}"})
    }