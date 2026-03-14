-- ── Query 1: KPI Summary ─────────────────────
SELECT
  COUNT(*) AS total_transactions,
  SUM(Class) AS total_fraud,
  ROUND(SUM(Class)/COUNT(*)*100, 4) AS fraud_rate_pct,
  COUNT(*) - SUM(Class) AS total_legit,
  ROUND(AVG(
    CASE WHEN Class = 1
    THEN Amount END), 2) AS avg_fraud_amount,
  ROUND(MAX(
    CASE WHEN Class = 1
    THEN Amount END), 2) AS max_fraud_amount,
  SUM(is_high_value) AS high_value_txns,
  SUM(is_night) AS night_txns
FROM fraud_db.silver_transactions;

-- ── Query 2: Fraud by Hour ───────────────────
SELECT
  hour_of_day,
  COUNT(*) AS total_txns,
  SUM(Class) AS fraud_count,
  ROUND(SUM(Class)/COUNT(*)*100, 4) AS fraud_rate_pct,
  ROUND(AVG(Amount), 2) AS avg_amount
FROM fraud_db.silver_transactions
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- ── Query 3: Fraud by Category ───────────────
SELECT
  amount_category,
  COUNT(*) AS total_txns,
  SUM(Class) AS fraud_count,
  ROUND(SUM(Class)/COUNT(*)*100, 4) AS fraud_rate_pct,
  ROUND(AVG(Amount), 2) AS avg_amount
FROM fraud_db.silver_transactions
GROUP BY amount_category
ORDER BY fraud_rate_pct DESC;

-- ── Query 4: Night vs Day ────────────────────
SELECT
  CASE WHEN is_night = 1
       THEN 'Night (10PM-4AM)'
       ELSE 'Day (4AM-10PM)'
  END AS time_period,
  COUNT(*) AS total_txns,
  SUM(Class) AS fraud_count,
  ROUND(SUM(Class)/COUNT(*)*100, 4) AS fraud_rate_pct
FROM fraud_db.silver_transactions
GROUP BY is_night
ORDER BY fraud_rate_pct DESC;

-- ── Query 5: Risk Levels ─────────────────────
SELECT
  risk_level,
  COUNT(*) AS total_txns,
  SUM(actual_class) AS confirmed_fraud,
  ROUND(AVG(fraud_probability)*100, 2) AS avg_fraud_prob_pct,
  ROUND(AVG(Amount), 2) AS avg_amount
FROM fraud_db.gold_predictions
GROUP BY risk_level
ORDER BY avg_fraud_prob_pct DESC;

-- ── Query 6: Model Performance ───────────────
SELECT
  COUNT(*) AS total_predictions,
  SUM(CASE WHEN predicted_class = 1
       AND actual_class = 1
       THEN 1 END) AS true_positives,
  SUM(CASE WHEN predicted_class = 1
       AND actual_class = 0
       THEN 1 END) AS false_positives,
  SUM(CASE WHEN predicted_class = 0
       AND actual_class = 1
       THEN 1 END) AS false_negatives,
  ROUND(
    SUM(CASE WHEN predicted_class = actual_class
         THEN 1 END)/COUNT(*)*100, 2
  ) AS accuracy_pct
FROM fraud_db.gold_predictions;

-- ── Query 7: Critical Transactions ───────────
SELECT
  ROUND(Amount, 2) AS amount,
  hour_of_day,
  CASE WHEN is_night = 1
       THEN 'YES' ELSE 'NO'
  END AS is_night_txn,
  ROUND(fraud_probability*100, 2) AS fraud_prob_pct,
  risk_level,
  actual_class AS was_fraud
FROM fraud_db.gold_predictions
WHERE risk_level = 'CRITICAL'
ORDER BY fraud_probability DESC
LIMIT 50;