from fastapi import FastAPI, Request
import uvicorn
from database import engine, SessionLocal
from sqlalchemy.orm import Session
from fastapi import Depends, FastAPI, HTTPException
import sqlalchemy.sql.default_comparator
import models, crud


app = FastAPI()

def get_db():
    db = None
    try:
        db = SessionLocal()
        yield db
    finally:
        db.close()

@app.get("/")
async def root():
    return {"message": "Bienvenidos a la API de SHOWS"}

@app.get("/shows")
async def get_shows(db: Session = Depends(get_db)):
    return crud.get_shows(db=db)

@app.get("/teatros")
async def get_shows(db: Session = Depends(get_db)):
    return crud.get_teatros(db=db)

@app.get("/salas/{teatro_id}")
async def get_salas(teatro_id: int, db: Session = Depends(get_db)):
    return crud.get_salas(db=db, teatro_id=teatro_id)

@app.get("/butacas/{sala_id}")
async def get_butacas(sala_id: int, db: Session = Depends(get_db)):
    return crud.get_butacas(db=db, sala_id=sala_id)

@app.get("/funciones/{show_id}")
async def get_funciones(show_id: int, db: Session = Depends(get_db)):
    return crud.get_funciones(db=db, show_id=show_id)

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8081)