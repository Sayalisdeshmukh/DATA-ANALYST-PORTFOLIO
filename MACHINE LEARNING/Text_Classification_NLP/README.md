 ## NLP  Project

This project demonstrates text analysis and classification using Natural Language Processing (NLP) techniques. The main tasks include processing a text file, tokenizing it into words and sentences, creating a Bag of Words (BoW) representation, and using a Naive Bayes classifier to perform text classification.

## Project Overview
- The project uses the **NLTK** library to download and process the text from the Gutenberg corpus.
- A sample text from *Emma* by Jane Austen is used for analysis.
- The text is tokenized, preprocessed, and vectorized into a Bag of Words (BoW) model using **CountVectorizer**.
- A simple Naive Bayes classifier is used to perform binary classification on the sentences of the text.
- The classifier's performance is evaluated, and predictions are saved in a CSV file.

## Files in the Repository
- `text_classification_nlp.ipynb`: The Jupyter notebook containing all the code and analysis.
- `text_classification_nlp_output.csv`: The output file containing the predicted labels for each sentence from the text.
- `requirements.txt`: A file listing all necessary Python libraries to run the project.
- `README.md`: This file, which explains the project.

## Requirements
To run this project, you'll need Python 3.x and the following libraries:
- `nltk`
- `sklearn`
- `pandas`

You can install the required libraries using `pip`:

```bash
pip install -r requirements.txt


