import requests
from bs4 import BeautifulSoup
import time
import json

def scrape_gold_rates():
    """
    Scrapes gold rates from Groww website for Mumbai
    Returns list of text content from specified div class
    """
    # URL of the page
    url = "https://groww.in/gold-rates/gold-rate-today-in-mumbai"
    
    # Headers to mimic browser request
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    
    try:
        # Make the request
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise exception for bad status codes
        
        # Parse the HTML
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Find all divs with the specified class
        gold_rate_divs = soup.find_all('div', class_='grp846CardDiv backgroundPrimary borderPrimary valign-wrapper vspace-between')
        
        # Extract text from each div
        results = []
        for div in gold_rate_divs:
            div_text = div.get_text(strip=True, separator=' ')
            results.append(div_text)
            
        return results
        
    except requests.RequestException as e:
        print(f"Error fetching the webpage: {e}")
        return None
    except Exception as e:
        print(f"Error parsing the webpage: {e}")
        return None

def write_json_file(data):
    f = open("gold_rates.json", "w")
    json.dump(data, f, ensure_ascii=True, indent=4)
    f.close()

def main():
    # Add delay to be respectful to the website
    time.sleep(2)
    # Scrape the rates
    gold_rates = scrape_gold_rates()
    rates_parsed = []
    for object in gold_rates:
        split_object = object.split()
        data = {"purity":split_object[0], 
                "date": " ".join(split_object[4:7]),
                "currency":"INR", # TODO: HARDCODED VALUE
                "rate_per_10gm":split_object[8],
                "rate_per_1gm":round(float(split_object[8])/10,4),
                "fluctuation":split_object[11]
                }
        rates_parsed.append(data)
    write_json_file(rates_parsed)
    
    if gold_rates:
        print("Found Gold Rates:")
        for object in rates_parsed:
            print(object)
    else:
        print("Failed to retrieve gold rates")

if __name__ == "__main__":
    main()