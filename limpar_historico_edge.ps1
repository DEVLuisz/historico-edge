# Script para excluir apenas o histórico de navegação do Microsoft Edge

# Caminho para o arquivo de histórico
$edgeHistoryPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History"

# Verifica se o arquivo existe
if (Test-Path $edgeHistoryPath) {
    try {
        # Tenta fechar o Edge para liberar o arquivo
        Stop-Process -Name "msedge" -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2

        # Remove o arquivo de histórico
        Remove-Item $edgeHistoryPath -Force

        # Reinicia o navegador
        Start-Process "msedge.exe"
    } catch {
        Write-Output "Erro ao tentar excluir o histórico: $_"
    }
} else {
    Write-Output "Histórico não encontrado ou já foi excluído."
}
