# ---- Installa se necessario
# brew install imagemagick
# brew install ghostscript

# ---- Funzione per convertire lista di PDF in PNG con lo stesso nome ----
pdf2png() {
  # 2 argomenti: cartella input, cartella output
  local inputdir="${1:-.}"  # Default: cartella corrente
  local outputdir="${2:-.}"  # Default: cartella corrente

  # Crea cartella output se non esiste
  mkdir -p "$outputdir"

  # Loop attraverso tutti i file PDF nella cartella di input
  for pdffile in "$inputdir"/*.pdf; do
    # Estrai il nome del file senza estensione
    local filename=$(basename "$pdffile" .pdf)

    # Converti PDF in PNG (una pagina per file PNG)
    magick -density 300 "$pdffile" "$outputdir/${filename}.png"
  done
}

# --- Esempio di utilizzo della funzione ---
# pdf2png "cartella_input" "cartella_output"
# --- Esempio [QUI] di utilizzo della funzione ---
cd bib/pagine
pdf2png "." "./png"
