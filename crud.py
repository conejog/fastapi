
from sqlalchemy.orm import Session

import models


def get_shows(db: Session):
    return db.query(models.Show).all()

def get_teatros(db: Session):
    return db.query(models.Teatro).all()

def get_salas(db: Session, teatro_id: int):
    return db.query(models.Sala).filter(models.Sala.idTeatro == teatro_id).all()

def get_butacas(db: Session, sala_id: int):
    return db.query(models.Butaca, models.Sala).join(models.Sala, models.Sala.idSala == models.Butaca.idSala).filter(models.Butaca.idSala == sala_id).all()

def get_funciones(db: Session, show_id: int):
    return db.query(models.Funcion, models.Teatro.Teatro, models.Show.Titulo, models.Precio.idButaca, models.Precio.Precio).\
        join(models.Show, models.Funcion.idShow == models.Show.idShow).\
        join(models.Teatro, models.Funcion.idTeatro == models.Teatro.idTeatro).\
        join(models.Precio, models.Funcion.idFuncion == models.Precio.idFuncion).filter(models.Funcion.idShow == show_id).all()