import scrapy
from bookscraper.items import  BookscraperItem

class BookspiderSpider(scrapy.Spider):
    name = "bookspider"
    allowed_domains = ["books.toscrape.com"]
    start_urls = ["https://books.toscrape.com"]

    def parse(self, response):

        next_page = response.xpath("//li[@class='next']/a/@href").get()

        if next_page is not None :
            yield response.follow(next_page, self.parse)

    def parse_book(self,response) :

        item = BookscraperItem()
        item['title'] = response.xpath('./h3/a/text()').get()
        item['price'] = response.xpath("//p[@class='price_color']/text()").get()
        item['stock'] = response.xpath(".//p[@class='instock availability']/text()").getall()[-1]
        item['upc'] = response.xpath("//th[text()='UPC']/following-sibling::td/text()").get()
            
        yield item

        