from flask import render_template, request, redirect, url_for
from app import app, db
from app.models import User

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    name = request.form['name']
    email = request.form['email']
    phone = request.form.get('phone', '')  # Optional field
    user = User(name=name, email=email, phone=phone)

# Server-side validation for phone number (must be numeric and exactly 10 digits)
    if phone and (not phone.isdigit() or len(phone) != 10):
        flash("Phone number must be exactly 10 digits.", "error")
        return redirect(url_for('index'))

    db.session.add(user)
    db.session.commit()
    return redirect(url_for('index'))
