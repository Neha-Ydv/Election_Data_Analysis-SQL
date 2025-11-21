# 🗳️ Indian Election SQL Data Analysis Project

[![SQL](https://img.shields.io/badge/SQL-DataAnalysis-blue)](https://github.com/Neha-Ydv/Election_Data_Analysis-SQL)
[![Indian Elections](https://img.shields.io/badge/Indian-Parliamentary-orange)](https://eci.gov.in)

---

## 🔍 Project Overview
Analyze the Indian Parliamentary Election Dataset using SQL to uncover actionable insights on national, alliance, state, party, and candidate performance.  
This project demonstrates advanced SQL skills using relational data and complex queries to reveal voting patterns, margins, and trends across the political landscape.

---

## 🎯 Objectives of the Analysis

- **Total seat analysis**: Quantify seats contested and won across all states.
- **Alliance-wise performance**: Evaluate NDA 🇳🇪, INDIA 🤝, and OTHER parties by seats/votes.
- **State-level performance**: Understand how political strengths shift across states.
- **Party & candidate insights**: Discover top parties/candidates by vote, margin, and success rate.
- **Vote distribution & margins**: Explore closely fought battles and dominant wins.
- **Maharashtra insights**: Zoomed focus on state-specific patterns, swing regions, and notable performances.

---

## 📂 Dataset Description

| Dataset                    | Key Columns & Description                                                     |
|----------------------------|-------------------------------------------------------------------------------|
| `states.csv`               | `state_id`, `state_name` — Indian states and union territories               |
| `statewise_results.csv`    | `state_id`, `total_seats`, `nda_seats`, `india_seats`, `other_seats`         |
| `partywise_results.csv`    | `party_name`, `state_id`, `alliance`, `seats_won`, `votes`, `vote_share`     |
| `constituencywise_results.csv` | `constituency_id`, `state_id`, `winner`, `runner_up`, `margin`, `votes`         |
| `constituencywise_details.csv` | `constituency_id`, `candidate_name`, `party_name`, `votes`, `alliance`           |

### 🧩 Relationships
- `state_id` joins main tables for aggregations.
- `constituency_id` links results with candidate details.
- `party_name` and `alliance` map performances across states.

---

## 🧩 ER Diagram
<img width="1536" height="1024" alt="er election" src="https://github.com/user-attachments/assets/22ba6fa5-5bc1-42ab-be43-2a66db8509aa" />



---

## 🛠️ SQL Approach & Methodology

- **Joins**: 🔗 Used INNER/LEFT joins to connect state, party, constituency, and candidate tables.
- **Aggregations**: 📊 SUM/AVG/COUNT for total seats, votes, margins.
- **Conditional Logic**: CASE for alliance classifications and edge-case handling (IND/NDA/Others).
- **Window Functions**: ROW_NUMBER, RANK to rank candidates by vote, margin, performance, per state.
- **Data Cleaning**: Standardize party/alliance names (e.g., via CASE/LOWER/REPLACE).
- **Insights Value**: Queries answer tactical election questions—target swing states, winning parties, vote trends, margin analysis.

---

## 📊 Key Insights (Based on SQL)

- 📋 **Total Seats**: 543 parliamentary seats analyzed.
- 🟦 **NDA Seat Share**: NDA led with XX seats (SQL-derived).
- 🟥 **INDIA Seat Share**: INDIA alliance secured XX seats.
- 🟨 **Top Parties**: BJP 🟦, INC 🟥, TMC 🟨 among those with largest seat/vote share.
- 📍 **State-wise Winners**: Southern states favor INDIA, heartland states favor NDA.
- 🤝 **Alliance Strength**: NDA dominates northern belt, INDIA coalition strong in south/east.
- 🏅 **Top Vote-Gaining Candidates**: Candidate X (Party Y) scored most votes (>X lakh).
- 🥈 **Runner-Up Analysis**: XX constituencies with margin <10,000 votes.
- 🚩 **Maharashtra Summary**: Swing seats concentrated in urban regions; tight margins.

---

## 🧠 Key Findings

- **Regional diversity drives alliance performance**; no single alliance dominates everywhere.
- **Top parties have strongholds and weak zones**—requiring local strategies.
- **Close contests highlight competitive democracy**; small margins in key states.
- **Maharashtra remains a genuine swing region; margins, alliance flips, urban/rural divide.**

---

## 📝 Conclusion & Recommendations

- **For alliances:** Target swing states with high voter turnout but low margin seats.
- **NDA:** Consolidate northern/belt, diversify appeal in southern states.
- **INDIA:** Strengthen rural outreach and urban turnout in heartland.
- **State-level recommendation:** Prioritize candidate selection and alliance formation based on historical margin analysis.

---

