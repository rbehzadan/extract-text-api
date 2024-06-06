from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from goose3 import Goose

app = FastAPI()

class HTMLRequest(BaseModel):
    content: str

@app.post("/extract-text")
async def extract_text(request: HTMLRequest):
    g = Goose()
    html_content = request.content

    try:
        article = g.extract(raw_html=html_content)
        cleaned_text = article.cleaned_text
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error extracting text: {str(e)}")

    if not cleaned_text:
        raise HTTPException(status_code=404, detail="No extractable text found")

    return {"text": cleaned_text}
