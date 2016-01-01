# Runs the entire pipeline for downloading resources.



from kcinit import *

def runScraperPipeline():
  import abyssalline_scraper
  import equipment_scraper
  import furniture_scraper
  import map_scraper
  import music_scraper
  import ship_swf_scraper
  import shipline_scraper
  import unused_ship_swf_scraper

  # abyssalline_scraper.scrapeAbyssalLines(customPath=None,overwrite=False)
  # equipment_scraper.scrapeEquipment(customPath=None,overwrite=False)
  # furniture_scraper.scrapeFurniture(customPath=None,overwrite=False)
  # map_scraper.scrapeMap(customPath=None,overwrite=False)
  # music_scraper.scrapeMusic(toDownload = "all", 
  #                           overwrite = False,
  #                           customPath = None,
  #                           humanReadable = False,
  #                           humanReadableEn = True)
  # ship_swf_scraper.scrapeShipSWF(toScrape=None, 
  #                                overwrite=False,
  #                                customPath=None,
  #                                namesInEn=True)
  shipline_scraper.scrapeShiplines(toScrape=None, 
                                   linesToCheck=[2,3,4], 
                                   overwrite=True,
                                   customPath=os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data", "temp"),
                                   namesInEn=True)
  # unused_ship_swf_scraper.scrapeUnusedShipSWF(overwrite=False,
  #                                             customPath=None)
  


runScraperPipeline()