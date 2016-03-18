from flask import Flask

app = Flask(__name__)

@app.route('/demoRest/test/')
def test():
    return 'Success!'

if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = 9999, debug = True)
