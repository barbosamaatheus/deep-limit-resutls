# Deep Limit Results — Large Files Handling

Este repositório contém **resultados experimentais completos**, incluindo **arquivos de log grandes** gerados automaticamente durante as execuções.

Devido a **restrições do GitHub (limite de 100 MB por arquivo)**, foi adotada a estratégia de **divisão de arquivos grandes em partes menores**, que podem ser versionadas normalmente.

---

## 📦 Arquivos afetados

Os seguintes arquivos podem exceder 100 MB e, portanto, **não são versionados diretamente**:

- `out.txt`
- `conflicts_log.txt`

Em vez disso, eles são armazenados como partes:

```

out.txt.part000
out.txt.part001
out.txt.part002
...

````

O mesmo vale para `conflicts_log.txt`.

---

## ✂️ Divisão dos arquivos (split)

Para dividir automaticamente os arquivos grandes em partes menores (< 100 MB), execute:

```bash
chmod +x split_large_files.sh
./split_large_files.sh
````

Esse script:

* Divide `out.txt` e `conflicts_log.txt` em partes de até ~90 MB
* Remove o arquivo original após a divisão
* Mantém a ordem correta das partes

---

## 🔁 Reconstrução dos arquivos (join)

Para reconstruir os arquivos originais a partir das partes versionadas:

```bash
chmod +x join_large_files.sh
./join_large_files.sh
```

Esse script:

* Detecta automaticamente os arquivos `.part000`
* Junta todas as partes na ordem correta
* Recria o arquivo original (`out.txt` ou `conflicts_log.txt`)