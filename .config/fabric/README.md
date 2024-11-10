## How use [fabric](https://github.com/danielmiessler/fabric)

### Run ollama
```sh
ollama serve
```

### fabric examples
- Run the summarize Pattern based on input from stdin. In this case, the body of an article.
`pbpaste | fabric --pattern summarize`

- Run the analyze_claims Pattern with the --stream option to get immediate and streaming results.
`pbpaste | fabric --stream --pattern analyze_claims`

- Run the extract_wisdom Pattern with the --stream option to get immediate and streaming results from any Youtube video (much like in the original introduction video).
`fabric -y "https://youtube.com/watch?v=uXs-zPc63kM" --stream --pattern extract_wisdom`

- Ask to the IA 
`echo "what is the tallest tree in the world" | fabric -sp ai`

- Improve a pattern 
`echo "my pattern" | fabric -sp improve_prompt`
`vim .config/fabric/patterns/my-folder/my-pattern.md`

- Check all the patterns available `ls .config/fabric/patterns`

### fabric patterns

[patterns](https://github.com/danielmiessler/fabric/tree/main/patterns)
