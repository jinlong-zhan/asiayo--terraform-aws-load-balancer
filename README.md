# Terraform AWS Load Balancer

## 目標
建立一個 AWS 上的高可用性負載平衡器 (Load Balancer) 架構，並在其後端接上兩台網頁伺服器，展示主機名稱。

## 架構
- **VPC**: 創建一個虛擬私有雲 (VPC) 以提供隔離的網路環境。
- **子網**: 在不同可用區域創建子網，以確保高可用性。
- **EC2 實例**: 部署兩台網頁伺服器，顯示伺服器的主機名稱。
- **Security Group**: 配置安全組以允許 HTTP 和 SSH 流量。
- **Application Load Balancer (ALB)**: 創建 ALB 來分配流量並實現負載均衡。

## 使用指引
1. 初始化 Terraform：
   ```bash
   terraform init
   ```

2. 檢查設定：
   ```bash
   terraform plan
   ```

3. 應用設定：
   ```bash
   terraform apply
   ```

4. 檢查結果：
   使用 Terraform 輸出的 ALB DNS 名稱，訪問該名稱以確認伺服器的回應。

## 文件結構
```plaintext
terraform-aws-load-balancer/
│
├── main.tf                 # 主設定文件，引入模組
├── variables.tf            # 定義變數
├── outputs.tf              # 定義輸出變數
├── README.md               # 相關說明
│
├── vpc/
│   ├── main.tf             # VPC 設定
│   ├── variables.tf        # VPC 變數
│   └── outputs.tf          # VPC 輸出變數
│
├── security_group/
│   ├── main.tf             # Security Group 設定
│   ├── variables.tf        # Security Group 變數
│   └── outputs.tf          # Security Group 輸出變數
│
├── ec2/
│   ├── main.tf             # EC2 實例設定
│   ├── variables.tf        # EC2 變數
│   └── outputs.tf          # EC2 輸出變數
│
└── alb/
    ├── main.tf             # ALB 設定
    ├── variables.tf        # ALB 變數
    └── outputs.tf          # ALB 輸出變數
```
