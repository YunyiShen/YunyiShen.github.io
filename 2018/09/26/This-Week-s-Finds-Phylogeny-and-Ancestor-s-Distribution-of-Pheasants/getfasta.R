require(rvest)
require(XML)
require(RCurl)
library(Rwebdriver)

workdir = 'I:/Yunyi/2.Pheasant/Pheasant Phylogeny/phylo-clim'
savedir = paste(workdir,'mitogenome',sep = '/')
setwd(workdir)
urlleft = 'https://www.ncbi.nlm.nih.gov/nuccore/'
urlright = '?report=fasta'
session_root = 'http://localhost:5555/wd/hub/'
start_session(root = session_root,browser = "chrome",
              javascriptEnabled = TRUE, takesScreenshot = TRUE,
              handlesAlerts = TRUE, databaseEnabled = TRUE,
              cssSelectorsEnabled = TRUE)



specieslist = read.csv('mitogenome species.list.csv')
specieslist$Scientific.name = as.character(specieslist$Scientific.name)
specieslist$Accession.No. = as.character(specieslist$Accession.No.)

fasfile = file('pheasants_50.txt','w')

for(i in 43:nrow(specieslist)){
  species = specieslist$Scientific.name[i]
  url = paste0(urlleft,specieslist$Accession.No.[i],urlright)
  post.url(url)
  Sys.sleep(5)
  print(species)
  print(i/nrow(specieslist))
  get.html = page_source()
  page.source = htmlParse(get.html,asText = T,encoding = 'UTF-8')
  fasta1 = page.source %>% getNodeSet('//pre')  
  fasta = fasta1[[1]] %>% xmlValue()
  writeLines(fasta,fasfile)
  writeLines('\n',fasfile)
}

close(fasfile)
