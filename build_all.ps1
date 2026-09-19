# PowerShell script to build all Quran flavors automatically

$flavors = @(
    "mraj",
    "noh",
    "jen",
    "mozamel",
    "mdser",
    "ghiyamt",
    "nsan",
    "mrslt",
    "naba",
    "nazat",
    "abas",
    "takwir",
    "nftar",
    "mtffin",
    "nshqaq",
    "broj",
    "taregh",
    "ala",
    "qashie",
    "fajr",
    "balad",
    "shams",
    "layl",
    "zoha",
    "sharh",
    "tin",
    "alaq",
    "qadr",
    "bayyina",
    "zalzalah",
    "adiyat",
    "qariah",
    "takathur",
    "asr",
    "humazah",
    "fil",
    "quraysh",
    "maun",
    "kawthar",
    "kafirun",
    "nasr",
    "masad",
    "ikhlas",
    "falaq",
    "nas"
)

foreach ($flavor in $flavors) {
    Write-Host "🚀 Building flavor: $flavor" -ForegroundColor Cyan
    flutter build appbundle --flavor $flavor --release
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Done: $flavor" -ForegroundColor Green
    } else {
        Write-Host "❌ Failed: $flavor" -ForegroundColor Red
    }
}
