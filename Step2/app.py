from flask import Flask
import html
app = Flask(__name__)

@app.route('/')
def hello():
	return "Hello World!"
@app.route('/contatti')
def contatti():
	return '''<ul>
                    <li>Ciro</li>
                    <li>Ciccio</li>
                    <li>Sandro</li>
            </ul>'''
if __name__ == '__main__':
	app.run(host='0.0.0.0', port=50000)