$path = $MyInvocation.MyCommand.Path | Split-Path

docker image build -t apachecopy $path\materials\