. ./health.properties
echo "$HEALTHHDFSOP"
hadoop fs -mkdir  /"$HEALTHHDFSOP"
hadoop fs -put PdfHealthInputFile.pdf /"$HEALTHHDFSOP"
