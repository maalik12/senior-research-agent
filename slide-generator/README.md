# Academic Slide Generator

A web application that automatically generates academic PowerPoint presentations from PDF documents.

## Features

- **PDF Upload**: Drag and drop or upload your academic PDF documents
- **Automatic Content Extraction**: Extracts key points and text from your document
- **Template Selection**: Choose from multiple professional background templates
  - Academic Blue
  - Minimal White
  - Dark Professional
  - Academic Green
- **Slide Editor**: Edit extracted content, add/remove slides
- **Customizable**: Adjust font size and styling
- **PowerPoint Export**: Download as .pptx file ready for presentation

## Architecture

- **Backend**: Python Flask API
  - PDF text extraction using PyMuPDF
  - PowerPoint generation using python-pptx
  - RESTful API endpoints
  
- **Frontend**: Vanilla HTML/CSS/JavaScript
  - Modern, responsive UI
  - Drag-and-drop file upload
  - Real-time slide editing

## Installation

### Prerequisites
- Python 3.8+
- Node.js (optional, for frontend development)

### Backend Setup

1. Navigate to the backend directory:
```bash
cd backend
```

2. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Run the server:
```bash
python main.py
```

The backend will start on `http://localhost:5000`

### Frontend Setup

Simply open `frontend/index.html` in your web browser, or serve it with a local server:

```bash
# Using Python
cd frontend
python -m http.server 8080

# Then open http://localhost:8080 in your browser
```

## Usage

1. **Start the backend server** (must be running on port 5000)
2. **Open the frontend** in your browser
3. **Upload a PDF document** by dragging it or clicking "Choose File"
4. **Wait for analysis** - the app will extract key points from your document
5. **Select a template** style for your presentation
6. **Edit slides** as needed - modify titles, content, add or remove slides
7. **Click "Generate Presentation"** to download your PowerPoint file

## API Endpoints

### POST /api/analyze
Upload and analyze a PDF document
- **Input**: multipart/form-data with 'document' field (PDF file)
- **Output**: JSON with extracted slide content

### POST /api/generate
Generate PowerPoint presentation
- **Input**: JSON with slides array, background_color, font_size
- **Output**: PowerPoint file (.pptx) download

### GET /api/templates
Get available presentation templates
- **Output**: JSON array of template objects

## Customization

You can easily customize:
- **Templates**: Add new templates in `backend/main.py` in the `/api/templates` endpoint
- **Styling**: Modify CSS in `frontend/index.html`
- **Extraction Logic**: Update the `extract_text_from_pdf` function for better content extraction

## Future Enhancements

- AI-powered content summarization using OpenAI API
- More template options with images and layouts
- Support for other document formats (DOCX, TXT)
- User authentication and saved presentations
- Chart and graph generation from data
- Collaborative editing features

## License

MIT License - Feel free to use and modify for your needs!
