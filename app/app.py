from flask import Flask, request, render_template_string
import redis
import os

app = Flask(__name__)
r = redis.Redis(host=os.getenv('REDIS_HOST', 'redis'), port=6379, db=0)
ENV = os.getenv('ENVIRONMENT', 'test')

TEMPLATE = '''
<h1>Hello from {{ env }}</h1>
<p>Counter: {{ count }}</p>
<form method="post"><button>Increment</button></form>
'''

@app.route('/', methods=['GET','POST'])
def index():
    if request.method == 'POST':
        r.incr('counter')
    count = r.get('counter') or b'0'
    return render_template_string(TEMPLATE, count=int(count), env=ENV)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
