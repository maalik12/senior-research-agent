class BaseLLM:
    def complete(self, messages):
        raise NotImplementedError

class QwenLLM(BaseLLM):
    def __init__(self, api_key, model='qwen-max'):
        self.api_key = api_key
        self.model = model
        self.base_url = 'https://dashscope.aliyuncs.com/api/v1/services/aigc/text-generation/generation'

    def complete(self, messages):
        import json
        import urllib.request
        headers = {
            'Content-Type': 'application/json',
            'Authorization': f'Bearer {self.api_key}'
        }
        data = {
            'model': self.model,
            'input': {'messages': messages},
            'parameters': {'result_format': 'message'}
        }
        req = urllib.request.Request(
            self.base_url,
            data=json.dumps(data).encode('utf-8'),
            headers=headers
        )
        with urllib.request.urlopen(req) as response:
            result = json.loads(response.read().decode('utf-8'))
            return result['output']['choices'][0]['message']['content']
