🎧 Spotify Streaming Data Analysis Dashboard
📌 Project Overview

This project analyzes a Spotify streaming dataset to uncover insights related to:

Track popularity

Artist dominance

Platform usage (Spotify vs YouTube)

Licensing impact on engagement

Audio feature characteristics (Danceability, Energy, Valence, Acousticness)

The project combines SQL-based data analysis with an interactive Power BI dashboard to present insights visually.

🛠 Tech Stack

SQL (PostgreSQL) – Data cleaning, aggregation, window functions, CTEs

Power BI – Dashboard development & interactive reporting

CSV Dataset – Spotify streaming data (17K+ tracks)

🗄 Database Schema

The dataset includes the following key fields:

artist

track

album

album_type

danceability

energy

valence

acousticness

liveness

views

likes

comments

stream

licensed

official_video

most_played_on

🔍 SQL Analysis Performed
📊 Exploratory Data Analysis (EDA)

Total tracks, artists, and albums

Distribution of album types

Platform-based track distribution

Data cleaning (removed inconsistent duration values)

🎯 Performance & Engagement Analysis

Top 10 tracks by streams

Top 10 artists by total streams

Average engagement per artist

Licensed vs Unlicensed content performance

Streams comparison across platforms

🎶 Audio Feature Analysis

Average danceability, energy, valence, and acousticness

Most energetic tracks

Album-type based feature comparison

Tracks above average liveness

🚀 Advanced SQL Queries

Top 3 most viewed tracks per artist (Window Functions)

Platform-wise stream comparison using subqueries

Energy variation across albums using CTE

Feature-based analytical filtering

📈 Power BI Dashboard Features

The interactive dashboard includes:

🔹 KPI Cards

Total Streams

Total Views

Total Likes

Total Comments

Total Artists

Total Tracks

🔹 Audio Feature Gauges

Avg Danceability

Avg Energy

Avg Valence

Avg Acousticness

🔹 Visualizations

Top 10 Tracks by Streams

Top Artists by Streams

Streams by Platform

Licensed vs Unlicensed Engagement

Album Type Distribution

Danceability vs Energy Scatter Plot

🔹 Interactive Slicers

Artist

Album Type

Platform

Licensed Status

📊 Key Insights

A small number of artists contribute a significant portion of total streams.

Licensed tracks generally show stronger engagement metrics.

Spotify accounts for the majority of streaming volume compared to YouTube.

High-energy tracks tend to cluster around moderate danceability levels.

Singles dominate track distribution compared to albums and compilations.

📂 Project Structure
📁 Spotify-Streaming-Analysis
│
├── spotify.sql
├── dataset.csv
├── spotify_dashboard.pbix
└── README.md
🎯 Business Relevance

This project demonstrates:

Analytical SQL proficiency

Data cleaning & transformation

Performance metric tracking

Interactive dashboard development

Business-oriented storytelling

📸 Dashboard Preview

(Add your Power BI dashboard screenshot here)

![Dashboard Screenshot](your-image-link-here)
🚀 Future Improvements

Correlation analysis between audio features and engagement

Time-series trend analysis (if release year available)

Predictive modeling for track popularity

Sentiment or genre-based clustering

👩‍💻 Author

Shusnigdha Saha
B.Tech CSE | Data Analytics Enthusias
