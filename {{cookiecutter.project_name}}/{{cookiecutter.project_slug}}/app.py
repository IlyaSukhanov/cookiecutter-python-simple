import os

from fastapi import Depends, FastAPI
from mangum import Mangum

from {{ cookiecutter.project_slug }}.schemas import GenericResponse

app = FastAPI(
    title="{{ cookiecutter.project_slug }}",
    openapi_url="/openapi.json",
)


@app.get("/", response_model=GenericResponse)
async def root():
    return {"message": "Hello World"}


handler = Mangum(app)
