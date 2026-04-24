class SeniorResearchAgent:
    def __init__(self, llm=None):
        self.llm = llm
        self.findings = []

    def research(self, query):
        if self.llm:
            messages = [{
                'role': 'system',
                'content': 'You are a senior research agent. Provide comprehensive analysis.'
            }, {
                'role': 'user',
                'content': f'Research this topic: {query}'
            }]
            result = self.llm.complete(messages)
            return {'query': query, 'synthesis': result}
        return {'query': query, 'synthesis': 'No LLM configured'}
