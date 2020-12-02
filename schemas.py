from typing import List
from pydantic import BaseModel


class Butaca(BaseModel):
    idButaca: int
    idSala: int 
    Sala: str   
    Cantidad: int 
  
    class Config:
        orm_mode = True
