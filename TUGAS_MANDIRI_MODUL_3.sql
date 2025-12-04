-- ambil 10 baris teratas dari hasil query
SELECT TOP 10
    ProductID,
    -- itung total pendapatan dari produk tersebut dan memberi alias TotalRevenue
    SUM(LineTotal) AS TotalRevenue
-- ambil data dari tabel Sales.SalesOrderDetail
FROM Sales.SalesOrderDetail
-- filt hanya transaksi dengan jumlah pembelian >= 2
WHERE OrderQty >= 2
-- group data berdasarkan ProductID agar bisa dihitung total per produk
GROUP BY ProductID
-- filter grup yang total pendapatannya > $50,000
HAVING SUM(LineTotal) > 50000
-- mengurutkan dari pendapatan tertinggi ke terendah
ORDER BY SUM(LineTotal) DESC;

-- Ajib Firdaus