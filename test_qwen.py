import os
from src.models.llm_interface import QwenLLM
from src.agent.senior_agent import SeniorResearchAgent

# Load API key from environment
api_key = os.getenv('QWEN_API_KEY', 'your-key-here')

# Create Qwen LLM
llm = QwenLLM(api_key=api_key)

# Create agent with Qwen
agent = SeniorResearchAgent(llm=llm)

# Run research
result = agent.research('What are the latest advances in AI?')
print('Query:', result['query'])
print('Synthesis:', result['synthesis'])
