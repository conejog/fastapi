from sqlalchemy import Boolean, Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship

from database import Base

class Show(Base):
    __tablename__ = "shows"

    idShow = Column(Integer, primary_key=True, index=True)
    Titulo = Column(String)
    Descripcion = Column(String) 

class Teatro(Base):
    __tablename__ = "teatros"

    idTeatro = Column(Integer, primary_key=True, index=True)
    Teatro = Column(String)

class Sala(Base):
    __tablename__ = "salas"

    idSala = Column(Integer, primary_key=True, index=True)
    idTeatro = Column(Integer)
    Sala = Column(String)

    butacas = relationship("Butaca")


class Butaca(Base):
    __tablename__ = "butacas"

    idButaca = Column(Integer, primary_key=True, index=True)
    idSala = Column(Integer, ForeignKey("salas.idSala"))
    Butaca = Column(String)
    Cantidad = Column(Integer)

    salas = relationship("Sala", backref="salas")

class Funcion(Base):
    __tablename__ = "funciones"

    idFuncion = Column(Integer, primary_key=True, index=True)
    idTeatro = Column(Integer, ForeignKey("teatros.idTeatro"))
    idShow = Column(Integer, ForeignKey("shows.idShow"))
    Fecha = Column(String)
    Titulo = Column(String)

    teatros = relationship("Teatro", backref="teatros")
    shows = relationship("Show", backref="shows")

class Precio(Base):
    __tablename__ = "precios"

    idPrecio = Column(Integer, primary_key=True, index=True)
    idFuncion = Column(Integer, ForeignKey("funciones.idFuncion"))
    idButaca = Column(Integer, ForeignKey("butacas.idButaca"))
    Precio = Column(String)

    funciones = relationship("Funcion", backref="funciones")
    butacas = relationship("Butaca", backref="butacas")