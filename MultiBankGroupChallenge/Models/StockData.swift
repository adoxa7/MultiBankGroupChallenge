//
//  StockData.swift
//  MultiBankGroupChallenge
//
//  Created by Mamirova Akbota on 27.02.2026.
//

import Foundation

enum StockData {
    static let stocks: [Stock] = [
        Stock(
            symbol: "AAPL",
            name: "Apple Inc.",
            description: "Apple Inc. designs, manufactures, and markets smartphones, personal computers, tablets, wearables, and accessories. Known for the iPhone, Mac, iPad, Apple Watch, and services like the App Store and iCloud.",
            initialPrice: 182.52
        ),
        Stock(
            symbol: "MSFT",
            name: "Microsoft Corp.",
            description: "Microsoft Corporation develops and supports software, services, devices, and solutions worldwide. It is known for Windows, Office 365, Azure cloud platform, Xbox gaming, and LinkedIn.",
            initialPrice: 420.34
        ),
        Stock(
            symbol: "NVDA",
            name: "NVIDIA Corp.",
            description: "NVIDIA Corporation provides graphics, compute, and networking solutions. A leader in AI hardware, its GPUs power data centers, autonomous vehicles, and gaming platforms worldwide.",
            initialPrice: 875.20
        ),
        Stock(
            symbol: "AMZN",
            name: "Amazon.com Inc.",
            description: "Amazon.com, Inc. engages in retail, cloud computing, and digital streaming. It operates Amazon Web Services (AWS), the world's leading cloud infrastructure provider, alongside its massive e-commerce platform.",
            initialPrice: 178.92
        ),
        Stock(
            symbol: "META",
            name: "Meta Platforms Inc.",
            description: "Meta Platforms, Inc. develops products that connect people globally. It operates Facebook, Instagram, WhatsApp, and Messenger, and is investing heavily in augmented and virtual reality through its metaverse initiative.",
            initialPrice: 505.65
        ),
        Stock(
            symbol: "GOOGL",
            name: "Alphabet Inc.",
            description: "Alphabet Inc. is the parent company of Google. Its products include Google Search, YouTube, Android, Google Cloud, and Waymo self-driving technology. A dominant force in digital advertising.",
            initialPrice: 141.80
        ),
        Stock(
            symbol: "BRK.B",
            name: "Berkshire Hathaway",
            description: "Berkshire Hathaway Inc. is a multinational conglomerate holding company. Led by Warren Buffett, it owns subsidiaries in insurance (GEICO), freight rail (BNSF), utilities, and has major equity stakes in companies like Apple and Coca-Cola.",
            initialPrice: 398.10
        ),
        Stock(
            symbol: "UNH",
            name: "UnitedHealth Group",
            description: "UnitedHealth Group Incorporated is a diversified health care company. It operates through UnitedHealthcare, which provides health benefits, and Optum, which offers health services and analytics.",
            initialPrice: 520.80
        ),
        Stock(
            symbol: "TSLA",
            name: "Tesla Inc.",
            description: "Tesla, Inc. designs, develops, manufactures, and sells electric vehicles, energy generation and storage systems. It also develops self-driving technology and operates a global Supercharger network.",
            initialPrice: 195.40
        ),
        Stock(
            symbol: "MA",
            name: "Mastercard Inc.",
            description: "Mastercard Incorporated is a global technology company in the payments industry. It connects consumers, businesses, and governments via its secure payment network across more than 200 countries.",
            initialPrice: 472.20
        ),
        Stock(
            symbol: "V",
            name: "Visa Inc.",
            description: "Visa Inc. operates as a payment technology company facilitating digital payments globally. It provides transaction processing services, connecting issuers, merchants, and cardholders through VisaNet.",
            initialPrice: 278.50
        ),
        Stock(
            symbol: "JPM",
            name: "JPMorgan Chase",
            description: "JPMorgan Chase & Co. is a leading global financial services firm. It provides investment banking, financial services for consumers and small businesses, commercial banking, financial transaction processing, and asset management.",
            initialPrice: 198.70
        ),
        Stock(
            symbol: "PG",
            name: "Procter & Gamble",
            description: "The Procter & Gamble Company provides branded consumer packaged goods worldwide. Its portfolio includes brands such as Tide, Pampers, Gillette, Oral-B, and Pantene across 180+ countries.",
            initialPrice: 162.40
        ),
        Stock(
            symbol: "JNJ",
            name: "Johnson & Johnson",
            description: "Johnson & Johnson researches, develops, and sells healthcare products globally. It operates through the Innovative Medicine and MedTech segments, producing pharmaceuticals, medical devices, and consumer health products.",
            initialPrice: 152.30
        ),
        Stock(
            symbol: "HD",
            name: "Home Depot Inc.",
            description: "The Home Depot, Inc. is the largest home improvement retailer in the United States. It sells building materials, home improvement products, and lawn and garden products through over 2,300 stores.",
            initialPrice: 383.60
        ),
        Stock(
            symbol: "NFLX",
            name: "Netflix Inc.",
            description: "Netflix, Inc. is a global streaming entertainment service. It offers a wide variety of TV series, films, anime, documentaries, and games in numerous genres and languages to subscribers worldwide.",
            initialPrice: 628.90
        ),
        Stock(
            symbol: "ADBE",
            name: "Adobe Inc.",
            description: "Adobe Inc. is a software company offering products for digital media creation and marketing. Its Creative Cloud suite includes Photoshop, Illustrator, Premiere Pro, and Acrobat, serving creatives worldwide.",
            initialPrice: 578.30
        ),
        Stock(
            symbol: "CRM",
            name: "Salesforce Inc.",
            description: "Salesforce, Inc. provides Customer Relationship Management (CRM) technology. Its cloud-based platform helps companies manage sales, marketing, customer service, and commerce operations.",
            initialPrice: 298.60
        ),
        Stock(
            symbol: "DIS",
            name: "Walt Disney Co.",
            description: "The Walt Disney Company is a global entertainment and media company. It operates theme parks, produces motion pictures, and distributes content through Disney+, ABC, ESPN, and other networks.",
            initialPrice: 98.70
        ),
        Stock(
            symbol: "PYPL",
            name: "PayPal Holdings",
            description: "PayPal Holdings, Inc. is a leading digital payments company. It enables consumers and merchants to send and receive money online and in stores via PayPal, Venmo, and Braintree platforms.",
            initialPrice: 63.40
        ),
        Stock(
            symbol: "INTC",
            name: "Intel Corp.",
            description: "Intel Corporation designs and manufactures computing products worldwide. It is a major producer of CPUs for PCs and servers, and is investing in semiconductor manufacturing through its foundry services division.",
            initialPrice: 42.80
        ),
        Stock(
            symbol: "AMD",
            name: "Advanced Micro Devices",
            description: "Advanced Micro Devices, Inc. designs and sells semiconductor products. Its Ryzen CPUs and Radeon GPUs compete directly with Intel and NVIDIA, and its EPYC server processors have gained significant data center market share.",
            initialPrice: 168.30
        ),
        Stock(
            symbol: "ORCL",
            name: "Oracle Corp.",
            description: "Oracle Corporation provides database software, cloud services, and enterprise resource planning systems. Oracle Cloud Infrastructure (OCI) is its growing cloud platform competing in the enterprise market.",
            initialPrice: 126.50
        ),
        Stock(
            symbol: "IBM",
            name: "IBM Corp.",
            description: "International Business Machines Corporation provides integrated solutions and services worldwide. It focuses on hybrid cloud and AI, with platforms including IBM Cloud, Watson AI, and Red Hat OpenShift.",
            initialPrice: 189.20
        ),
        Stock(
            symbol: "QCOM",
            name: "Qualcomm Inc.",
            description: "QUALCOMM Incorporated engages in the development and commercialization of foundational technologies for the wireless industry. Its Snapdragon processors power most Android flagship smartphones globally.",
            initialPrice: 172.40
        )
    ]
}
