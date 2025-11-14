# Prima renderizza le slide
quarto render "IA_FB_note.qmd"

# Poi converti in PDF
decktape reveal IA_FB_note.html IA_FB_note.pdf && open IA_FB_note.pdf
